class AccountPremium
  def premium?
    true
  end

  def overdraft_charge(days_overdrawn)
    if premium?
      result = 10
      result += (days_overdrawn - 7) * 0.85 if days_overdrawn > 7
      result
    else
      days_overdrawn * 1.75
    end
  end
end

# Move the overdraft_charge method in the AcountPremium class.
#   Step 1 & 2

# The overdraft_charge method uses @days_overdrawn; it should stay at Account class.
class Account
  def initialize(days_overdrawn, account_type)
    @days_overdrawn = days_overdrawn
    @account_type = account_type
  end

  def overdraft_charge
    @account_type.overdraft_charge(@days_overdrawn)
  end

  def bank_charge
    result = 4.5
    result += overdraft_charge if @days_overdrawn > 0
    result
  end
end

my_account = Account.new(10, AccountPremium.new)
puts my_account.overdraft_charge
puts my_account.bank_charge
