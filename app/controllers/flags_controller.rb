class FlagsController < ApplicationController

  # GET /flags
  # GET /flags.json
  def index
    @flags = Flag.select("distinct product_id, reason")
    @flag_products = @flags.group_by{|f| f.product}.to_a
    @flag_products = Kaminari.paginate_array(@flag_products, total_count: @flag_products.length).page(params[:page]).per(12)
  end

  def show 
  end

  # GET /products/1/flags
  # GET /products/1/flags.json
  def new
    @product = Product.find(params[:product_id])
    @flags = @product.flags.build
  end

  def edit
  end

  # POST /products/1/flags
  # POST /products/1/flags.json
  def create
    @product = Product.find(params[:product_id])

    params[:flags][:reasons].each do |reason|
       @flag = @product.flags.build(reason: reason)
       @flag.save
     end

    respond_to do |format|
      if @flag.save
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @flag.errors.full_messages, 
                            status: :unprocessable_entity }
      end
    end
  end

  def create_multiple
    @product = Product.find(params[:product_id])

    @flag = @product.flags.build(flag_params)
  end


  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @flag.destroy
    respond_to do |format|
      format.html { redirect_to flags_url, notice: 'Flag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_flag
    @flag = Flag.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def flag_params
    params.require(:flags).permit(:product_id, :reason)
  end
end
