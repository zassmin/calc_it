class TransactionImportsController < SecureController

  def new
    @transaction_import = current_user.transaction_imports.new
  end

  def create
    @transaction_import = current_user.transaction_imports.new(params[:transaction_import])
    if @transaction_import.save!
      response = current_user.transaction_imports.parse(current_user.id, @transaction_import)
      flash[:notice] = 'CSV file upload transaction data was successfully and imported and the file saved the Amazon S3.'
      redirect_to transactions_path
    else
      flash[:error] = 'CSV transaction data  upload failed.'
      render action: 'new'
    end
  end

  def destroy
    last_transaction_import = current_user.transaction_imports.last
    last_transaction_import.destroy
    Transaction.delete_all(["transaction_import_id = ? ", last_transaction_import.id])
    flash[:notice] = 'Your last uploaded transaction data file was successfully deleted, and corresponding rows in the transactions table deleted.'
    redirect_to transactions_path
  end

end
