class TransactionsController < SecureController

  before_filter :find_transaction, only: [:edit, :update, :destroy]

  def index
    @transactions = current_user.transactions.order('transaction_date desc').page(params[:page]).per(10)
    @balance = current_user.transactions.sum(:amount).round(2)
  end

  def new
    @transaction = current_user.transactions.new
  end

  def create
    @transaction = current_user.transactions.new(params[:transaction])

    if @transaction.save
      redirect_to transactions_path, notice: 'Transaction was successfully created.'
    else
      render action: 'new'
    end

  end

  def edit
  end

  def update
    if @transaction.update_attributes(params[:transaction])
      redirect_to transactions_path, notice: 'Transaction was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @transaction.destroy
    redirect_to transactions_url, notice: 'Transaction was successfully deleted.'
  end

  private

  def find_transaction
    @transaction = current_user.transactions.find(params[:id])
  end
end
