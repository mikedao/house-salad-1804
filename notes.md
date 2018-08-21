group :development, :test do
  gem 'pry'
  gem 'rspec-rails'
  gem 'capybara'
end

$ bundle
$ rails g rspec:install
$ rails db:create
$ rails db:migrate

As a user
When I visit "/"
And I select "Colorado" from the dropdown
And I click on "Locate Members from the House"
Then my path should be "/search" with "state=CO" in the parameters
And I should see a message "7 Results"
And I should see a list of 7 the members of the house for Colorado
And they should be ordered by seniority from most to least
And I should see a name, role, party, and district for each member




spec/features/user_can_search_by_state_spec.rb


feature "visitor searches for member" do
  scenario "with valid state" do
    # As a user
    # When I visit "/"
    visit "/"

    # And I select "Colorado" from the dropdown
    select "Colorado", from: "state"

    # And I click on "Locate Members from the House"
    click_on "Locate Members from the House"

    # Then my path should be "/search" with "state=CO" in the parameters
    expect(current_path).to eq("/search")
    expect(current_url).to include("state=CO")

    # And I should see a message "7 Results"
    expect(page).to have_content("7 Results")

    # And I should see a list of 7 the members of the house for Colorado
    expect(page).to have_css(".member", count: 7)
    # And they should be ordered by seniority from most to least
    # And I should see a name, role, party, and district for each member

    within(first(".member")) do
      expect(page).to have_css(".name")
      expect(page).to have_css(".role")
      expect(page).to have_css(".party")
      expect(page).to have_css(".district")
    end
  end
end


app/helpers/application_helper.rb

def us_states
    [
      ['Alabama', 'AL'],
      ['Alaska', 'AK'],
      ['Arizona', 'AZ'],
      ['Arkansas', 'AR'],
      ['California', 'CA'],
      ['Colorado', 'CO'],
      ['Connecticut', 'CT'],
      ['Delaware', 'DE'],
      ['District of Columbia', 'DC'],
      ['Florida', 'FL'],
      ['Georgia', 'GA'],
      ['Hawaii', 'HI'],
      ['Idaho', 'ID'],
      ['Illinois', 'IL'],
      ['Indiana', 'IN'],
      ['Iowa', 'IA'],
      ['Kansas', 'KS'],
      ['Kentucky', 'KY'],
      ['Louisiana', 'LA'],
      ['Maine', 'ME'],
      ['Maryland', 'MD'],
      ['Massachusetts', 'MA'],
      ['Michigan', 'MI'],
      ['Minnesota', 'MN'],
      ['Mississippi', 'MS'],
      ['Missouri', 'MO'],
      ['Montana', 'MT'],
      ['Nebraska', 'NE'],
      ['Nevada', 'NV'],
      ['New Hampshire', 'NH'],
      ['New Jersey', 'NJ'],
      ['New Mexico', 'NM'],
      ['New York', 'NY'],
      ['North Carolina', 'NC'],
      ['North Dakota', 'ND'],
      ['Ohio', 'OH'],
      ['Oklahoma', 'OK'],
      ['Oregon', 'OR'],
      ['Pennsylvania', 'PA'],
      ['Puerto Rico', 'PR'],
      ['Rhode Island', 'RI'],
      ['South Carolina', 'SC'],
      ['South Dakota', 'SD'],
      ['Tennessee', 'TN'],
      ['Texas', 'TX'],
      ['Utah', 'UT'],
      ['Vermont', 'VT'],
      ['Virginia', 'VA'],
      ['Washington', 'WA'],
      ['West Virginia', 'WV'],
      ['Wisconsin', 'WI'],
      ['Wyoming', 'WY']
    ]
end


app/views/layouts/application.html.erb


<!DOCTYPE html>
<html>
  <head>
    <title>HouseSalad</title>
    <%= csrf_meta_tags %>

    <%= stylesheet_link_tag    'application', media: 'all' %>
    <%= javascript_include_tag 'application' %>
  </head>

  <body>
    <nav class="navbar navbar-default" role="navigation">
      <div class="navbar-header">
        <button class="navbar-toggle" data-target="#bs-example-navbar-collapse-1" data-toggle="collapse" type="button">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <%= link_to "HouseSalad", root_path, class: "navbar-brand" %>
      </div>
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
          <%= form_tag :search, method: :get, class: "form-inline" do %>
            <div class="form-group search-field">
              <%= select_tag :state, options_for_select(us_states) %>
              <%= submit_tag "Locate Members of the House", class: "btn btn-primary" %>
            </div>
          <% end %>
        </ul>
      </div>
    </nav>

    <%= yield %>
  </body>
</html>


# app/views/search/index.html.erb

<%= @members.count %> Results
<% @members.each do |member| %>
<ul class="member">
  <li class="name"><%= member.name %></li>
  <li class="role"><%= member.role %></li>
  <li class="party"><%= member.party %></li>
  <li class="district"><%= member.district %></li>
</ul>
<% end %>


S9JON3ruNOI6XiyymcnZ7gtsjnToPxuXyT0bgeaX