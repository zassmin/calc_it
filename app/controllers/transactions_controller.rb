class TransactionsController < SecureController

  before_filter :find_transaction, only: [:edit, :update, :destroy]

  def index
    @transactions = current_user.transactions
  end

  def new
    @transaction = current_user.transactions.new
  end

  def create
    @transaction = current_user.transactions.new(params[:transaction])

    #@transaction.save ? (redirect_to transactions_path, notice: 'Transaction was successfully created.') : (render action: 'new')

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

  def find_transaction
    @transaction = current_user.transactions.find(params[:id])
  end
end
