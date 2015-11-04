## Installation

```
gem install khipu-api-client
```

## Usage

### Basic usage
```ruby
require 'khipu-api-client'

Khipu.configure do  |c|
  c.secret = 'abc123'
  c.receiver_id = 1234
end

api = Khipu::PaymentsApi.new()
r1 = api.payments_post("Test de api nueva", "CLP", 1,
                       {expires_date: DateTime.new(2016,4,4),
                        send_email: true, payer_name: "payer",
                        payer_email: "payer@mail.com"})
print r1
r2 = api.payments_id_get(r1.payment_id)
print r2
```
