class ClientsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def index
        render json: Client.all
    end

    def show
        client = Client.find(params[:id])
        render json: client
    end

    def update
        client = Client.find(params[:id])
        client.update!(client_params)
        render json: client
    end

    private

    def client_params
        params.permit(:name, :age)
    end

    def not_found
        render json: {error: "Client Not Found"}, status: :not_found
    end

end
