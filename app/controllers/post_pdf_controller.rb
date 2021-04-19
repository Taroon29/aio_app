class PostPdfController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(current_user.id)
    @client = Client.find(params[:client_id])
    @invoice = Invoice.find(params[:invoice_id])
    respond_to do |format|
      format.html
      format.pdf do
        post_pdf = PostPdf.new(@invoice, @user, @client).render

        send_data post_pdf,
          filename: 'post_pdf.pdf',
          type: 'application/pdf',
          disposition: 'inline' # 外すとダウンロード
      end
    end
  end

  private

  def set_invoice
    params.require(:invoice).permit(:issue_date, :issue_number)
  end

  def set_items
    params.require(:invoice).permit()
  end

end