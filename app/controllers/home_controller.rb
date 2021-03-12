class HomeController < ApplicationController
  def index

    require "net/http"
    @url="https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=20002&distance=25&API_KEY=5DD25668-175F-4F97-8108-B047EFCC0164"
    @uri=URI(@url)
    @response=Net::HTTP.get(@uri)
    @output=JSON.parse(@response)

    if @output.empty?
      @final_output="Please Enter a valid Zip Code"
      @api_color="red"
    else
      @final_output=@output[0]['AQI']
      if @final_output<50
        @api_color="green"
      elsif @final_output>50 && @final_output<100
        @api_color="yellow"
      elsif @final_output>100 && @final_output<200
        @api_color="orange"
      else
        @api_color="pink"
      end
    end




  end
end
