class SpicesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found
rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid

    def index
        spices = Spice.all
        render json: spices, status: :ok
    end

    def show
        spice = find_spice
        render json: spice, status: :ok
    end

    def create
        spice = Spice.create!(spice_params)
        render json: spice, status: :created
    end

    def update
        spice = find_spice
        spice.update(spice_params)
        render json: spice
    end

    def destroy
        spice = find_spice
        spice.destroy
        head :no_content
    end


    private

    def find_spice
        Spice.find(params[:id])
    end

    def spice_params
        params.permit [:title, :image, :description, :notes, :rating ]
    end

    def render_record_not_found
        render json: {error: "record not found"}, status: :not_found
    end

    def render_record_invalid(invalid)
        render json: {errors: invalid.record.errors}, status: :unprocessable_entity
    end

end
