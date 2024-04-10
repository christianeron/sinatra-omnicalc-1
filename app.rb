require "sinatra"
require "sinatra/reloader"

#rakegrade 3waisvokTmjsMiMGnsL2XT6K

get("/") do
erb(:root)
end

get("/square/new") do
erb(:square)
end

get("/square/results") do
  @number = params.fetch("number").to_f
  @square = @number ** 2
erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root)
  end
  
  get("/square_root/results") do
    @user_number = params.fetch("user_number").to_f
    @square_root = @user_number ** 0.5.to_f
  erb(:square_root_results)
  end

get("/payment/new") do
  erb(:payment)
  end
  
  get("/payment/results") do
    @APR = params.fetch("user_apr").to_f
    @num_years = params.fetch("user_years").to_i
    @principal = params.fetch("user_pv").to_f
    monthly_rate = @APR/100/12
    @numerator = monthly_rate * @principal
    @denominator = (1-(1+monthly_rate) ** (-@num_years*12))
    @payment = @numerator / @denominator
  erb(:payment_results)
  end

get("/random/new") do
  erb(:random)
  end
  
  get("/random/results") do
    @user_min = params.fetch("user_min").to_f
    @user_max = params.fetch("user_max").to_f
    @random_result = rand(@user_min...@user_max).to_f
  erb(:random_results)
  end
  