# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  # variable for see all the movies
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    
    #debugger
    Movie.create(title: movie[:title], rating: movie[:rating], release_date: movie[:release_date])
  end
  #flunk "Unimplemented"
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  
  if page.body.respond_to? :should
    page.body.should =~ /#{e1}.*#{e2}/m
  else
    assert_no_match(/#{e1}.*#{e2}/m, page.body)
  end
  #flunk "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  
  #debugger
  # split the ratings "RG   ,  S, T   , X" => ["RG", "S", "T", "X"]
  rating_list = rating_list.gsub(/\s/, '').split(',')
  
  # do the loop :)
  rating_list.each do |rating|
    # decide if it's check or uncheck
    if uncheck == "un"
      step(%{I uncheck "ratings_#{rating}"})
    else
      step(%{I check "ratings_#{rating}"})
    end
  end
  #flunk "Unimplemented"
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  #debugger
  rows = Movie.all.length
  value = 10
  if rows.should == value
    rows.should == value 
  else
    assert_equal rows, value
  end
  #flunk "Unimplemented"
end
