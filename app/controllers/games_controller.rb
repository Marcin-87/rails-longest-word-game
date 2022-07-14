require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = 10.times.map { [*('A'..'Z')].sample }
  end

  def score
    @characters = params[:answer].upcase.chars
    @letters = new
    @letters.each { |el| @characters.delete_at(@characters.index(el)) if @characters.index(el) }
    @word = JSON.parse(URI.open("https://wagon-dictionary.herokuapp.com/#{params[:answer]}").read)
  end
end
