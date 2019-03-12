
## Installation

```sh
gem install khipu-api-client
```

## Usage

### Basic configuration
```ruby
require 'khipu-api-client'

Khipu.configure do  |c|
  c.secret           = 'abc123'
  c.receiver_id      = 1234
  c.platform         = 'my-ecomerce'  # (optional) please let us know :)
  c.platform_version = '1.0'
end
```

### Basic usage

#### Create a new payment
```ruby
api       = Khipu::PaymentsApi.new()
options   = {
              expires_date: Time.now + (24*60*60) # 1 day from now
              send_email:   true,
              payer_name:   "payer",
              payer_email:  "payer@mail.com"
            }
response  = api.payments_post("Test de api nueva", "CLP", 1, options)

print response
 # response keys:
 #   [:payment_id, :payment_url, :simplified_transfer_url, :transfer_url, :app_url]
```

There are a more params you can send in each request. You might want to consider adding these to the options:

```ruby
transaction_id      # transaction id in your system
return_url          # after (potential) success, the client will be redirected to this url
cancel_url          # if the payment is canceled, the client will be redirected to this url
notify_url          # khipu will send a notification to this url - the client will not see this request
notify_api_version  # "1.3"
```

#### Ask for payment status
```ruby
api    = Khipu::PaymentsApi.new()
status = api.payments_id_get(response.payment_id)
print status
```


#### Confirm a payment
If you send a notification_url when creating the payment or if you have set it up on your account configuration, Khipu will sent you a request with a notification_token and a api_version. You can use the notification_token param to get the payment information from the khipu service.

```ruby
notification_token = params["notification_token"]
client    = Khipu::PaymentsApi.new
response  = client.payments_get(notification_token)
if response.status == 'done'
  # order = get_order(response.transaction_id)
  # if order != nil and is_valid?(order, response)
  #   setPurchased(order)
  # end
end

print response
 # response keys:
 #   [
 #     :payment_id, :payment_url, :simplified_transfer_url, :transfer_url,
 #     :app_url, :ready_for_terminal, :subject, :amount, :currency, :status,
 #     :status_detail, :body, :picture_url, :receipt_url, :return_url,
 #     :cancel_url, :notify_url, :notify_api_version, :expires_date,
 #     :attachment_urls, :bank, :bank_id, :payer_name, :payer_email,
 #     :personal_identifier, :bank_account_number, :out_of_date_conciliation,
 #     :transaction_id, :custom, :responsible_user_email, :send_reminders, :send_email
 #   ]
```

### Documentation

- [API docs](https://khipu.com/page/api)
- [gem docs](http://www.rubydoc.info/gems/khipu-api-client/)
