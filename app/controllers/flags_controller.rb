class FlagsController < ApplicationController
  # GET /flags
  # GET /flags.json
  def index
    @flags = Flag.all.group(params[:product_id])
  end

  def show 
  end

  def new
    @product = Product.find(params[:product_id])
    @flag = @product.flags.build
  end

  def edit
  end

  # POST /flags
  # POST /flags.json
  def create
    @product = Product.find(params[:product_id])

    @flag = @product.flags.build(flag_params)


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

    # respond_to do |format|
    #   if @comment.save
    #     format.html { redirect_to post_path(@post), notice: 'Comment was successfully created.' }
    #     format.json { render json: @comment, status: :created, location: @comment }
    #     format.js   {
    #       @post = @comment.post
    #     }
    #   else
    #     format.html { render action: "new" }
    #     format.json { render json: @comment.errors, status: :unprocessable_entity }
    #   end
    # end


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
    params.require(:flag).permit(:product_id, :reason)
  end
end
