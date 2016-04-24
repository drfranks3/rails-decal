class ComplimentsController < ApplicationController

  def index
    # index view of user's compliments
    @mine = Compliment.where(to: current_user.id)
  end

  def new
    # allow composition of new compliment
    @compliment = Compliment.new
  end

  def report
    # report a compliment that passed a filter
  end

  def create
    # create a new compliment
    # TODO: validate if compliment is 'good'
    # TODO: figure out why IP is not saving properly

    if (params.include?(:compliment))
      submit = params[:compliment]

      # first check if the to: user exists
      valid = User.where('name LIKE :query OR id LIKE :query', query: "%#{submit[:to]}%").first
      to = valid == nil ? 0 : valid.id
      if !User.exists?(to)
        flash['error'] = 'Did not match any user. Please try again.'
        redirect_to :back
      else
        # next attempt to insert the compliment

        words = submit[:text].gsub(/\s+/m, ' ').strip.split(" ") # split the sentence into array of words

        sentiment_value = 0
        words.each do |w|
          if Sentiment.find_by_word(w) != nil # check whether the word is in our db
            sentiment_value += Sentiment.find_by_word(w).sentiment # add the sentiment value to our total
          else
            sentiment_value += 0
          end
        end

        if sentiment_value < 0
          flash['notice'] = 'Please send a more positive compliment.'
          redirect_to :back
          return
        end

        @compliment = Compliment.create location: "#{request.location.city} #{request.location.state}", from: current_user.id, to: to, text: submit[:text]

        if !@compliment.errors.blank?
          flash['error'] = @compliment.errors.full_messages.to_sentence
          redirect_to :back
        else
          flash['notice'] = 'Your compliment was sent successfully!'
          User.find(to).increment!(:count)
          redirect_to root_path
        end
      end
    end
  end

  private
    def compliment_params
      params.require(:compliment).permit(:to, :text)
    end

end
