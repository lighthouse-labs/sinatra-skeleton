You can add FactoryGirl factories in this directory and they'll
be automatically available in your tests. For example:

    # spec/factories/user_factory.rb

    FactoryGirl.define do
      # basic factory for class User, just fill any required attributes
      factory :user do
        name Faker::Name.name

        # factory that inherits from :user and customizes it
        factory :admin_user, class: User do
          is_admin true
        end
      end
    end

Using it in a test:

    # spec/models/user_spec.rb

    describe User do
      let(:user) { build(:user) }       # instantiate a User but don't save it
      let(:user2) { create(:user) }     # instantiate and save a User
      let(:user3) { create(:user, name: 'Vaz') }  # override attribute
      # ...
    end

For more information see:

- [FactoryGirl GETTING STARTED guide](http://www.rubydoc.info/gems/factory_girl/file/GETTING_STARTED.md)
- [Faker README](https://github.com/stympy/faker)
