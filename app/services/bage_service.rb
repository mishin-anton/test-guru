class BageService

  def initialize(user_test:)
    @user_test = user_test
    @user = @user_test.user
    @test = @user_test.test
  end

  def call
    Bage.all.each do |bage|
      set_bage(bage) if send("#{bage.rule.title}_award?", bage.rule)
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

  def programming_category_complete_award?(category_id)
    @user.tests.where("category_id = ?", category_id).uniq.count == Test.where("category_id = ?", category_id).count

  end

  def level_complete_award?(level)
    @user.tests.where("level = ?", level).uniq.count == Test.where("level = ?", level).count
  end

  def first_attempt_complete_award?(rule)
    @user.user_tests.where(test_id: @test.id).count == 1
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
