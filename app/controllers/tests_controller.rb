class TestsController < ApplicationController

  def index
    render inline: "<h1>All tests</h1><p><%= Test.all.each do |test| %><p>id: <%= test.id %> - <%= test.title %></p><% end %></p>"
  end
end
