class BageService

  def initialize(user_test:)
    @user_test = user_test
    @user = @user_test.user
    @test = @user_test.test
  end

  def call
    Bage.all.each do |bage|
      if bage.rule.title == 'programming_category_complete'
        if programming_category_complete(bage)
          set_bage(bage)
        end
      end

      if bage.rule.title == 'first_attempt_complete'
        if first_attempt_complete(bage)
          set_bage(bage)
        end
      end

      if bage.rule.title == 'level_complete'
        if level_complete(bage)
          set_bage(bage)
        end
      end

    end
  end

  private

  def set_bage(bage)
    bage_passage = BagePassage.find_by(user: @user, bage: bage)

    if bage_passage.present?
      bage_passage.update(count: bage_passage.count + 1)
    else
      BagePassage.create(user: @user, bage: bage, count: '1')
    end
  end

  def programming_category_complete(bage)
    passed_tests_ids = passed_by_category.pluck(:test_id).uniq.sort
    passed_tests_ids.present?

  end

  def level_complete(bage)
    passed_tests_ids    = passed_by_level.pluck(:test_id).uniq.sort
    comparing_tests_ids = Test.where(level: @test.level).pluck(:id).sort

    passed_tests_ids.present? && passed_tests_ids == comparing_tests_ids
  end

  def first_attempt_complete(bage)
    @user.user_test(@test)
  end

  def passed_by_category
    UserTest.includes(:user, test: [:category])
      .where(user: @user)
      .where(tests: { categories: { title: 'Programming' } })
  end

  def passed_by_level
    UserTest.includes(:user, :test)
      .where(user: @user)
      .where(tests: { level: @test.level })
  end
end
