module Khipu
  # 
  class PaymentsResponse < BaseObject
    attr_accessor :payment_id, :payment_url, :simplified_transfer_url, :transfer_url, :app_url, :ready_for_terminal, :notification_token, :receiver_id, :conciliation_date, :subject, :amount, :currency, :status, :status_detail, :body, :picture_url, :receipt_url, :return_url, :cancel_url, :notify_url, :notify_api_version, :expires_date, :attachment_urls, :bank, :bank_id, :payer_name, :payer_email, :personal_identifier, :bank_account_number, :out_of_date_conciliation, :transaction_id, :custom, :responsible_user_email, :send_reminders, :send_email
    # attribute mapping from ruby-style variable name to JSON key
    def self.attribute_map
      {
        
        # 
        :'payment_id' => :'payment_id',
        
        # 
        :'payment_url' => :'payment_url',
        
        # 
        :'simplified_transfer_url' => :'simplified_transfer_url',
        
        # 
        :'transfer_url' => :'transfer_url',
        
        # 
        :'app_url' => :'app_url',
        
        # 
        :'ready_for_terminal' => :'ready_for_terminal',
        
        # 
        :'notification_token' => :'notification_token',
        
        # 
        :'receiver_id' => :'receiver_id',
        
        # 
        :'conciliation_date' => :'conciliation_date',
        
        # 
        :'subject' => :'subject',
        
        # 
        :'amount' => :'amount',
        
        # 
        :'currency' => :'currency',
        
        # 
        :'status' => :'status',
        
        # 
        :'status_detail' => :'status_detail',
        
        # 
        :'body' => :'body',
        
        # 
        :'picture_url' => :'picture_url',
        
        # 
        :'receipt_url' => :'receipt_url',
        
        # 
        :'return_url' => :'return_url',
        
        # 
        :'cancel_url' => :'cancel_url',
        
        # 
        :'notify_url' => :'notify_url',
        
        # 
        :'notify_api_version' => :'notify_api_version',
        
        # 
        :'expires_date' => :'expires_date',
        
        # 
        :'attachment_urls' => :'attachment_urls',
        
        # 
        :'bank' => :'bank',
        
        # 
        :'bank_id' => :'bank_id',
        
        # 
        :'payer_name' => :'payer_name',
        
        # 
        :'payer_email' => :'payer_email',
        
        # 
        :'personal_identifier' => :'personal_identifier',
        
        # 
        :'bank_account_number' => :'bank_account_number',
        
        # 
        :'out_of_date_conciliation' => :'out_of_date_conciliation',
        
        # 
        :'transaction_id' => :'transaction_id',
        
        # 
        :'custom' => :'custom',
        
        # 
        :'responsible_user_email' => :'responsible_user_email',
        
        # 
        :'send_reminders' => :'send_reminders',
        
        # 
        :'send_email' => :'send_email'
        
      }
    end

    # attribute type
    def self.swagger_types
      {
        :'payment_id' => :'String',
        :'payment_url' => :'String',
        :'simplified_transfer_url' => :'String',
        :'transfer_url' => :'String',
        :'app_url' => :'String',
        :'ready_for_terminal' => :'BOOLEAN',
        :'notification_token' => :'String',
        :'receiver_id' => :'Integer',
        :'conciliation_date' => :'DateTime',
        :'subject' => :'String',
        :'amount' => :'Float',
        :'currency' => :'String',
        :'status' => :'String',
        :'status_detail' => :'String',
        :'body' => :'String',
        :'picture_url' => :'String',
        :'receipt_url' => :'String',
        :'return_url' => :'String',
        :'cancel_url' => :'String',
        :'notify_url' => :'String',
        :'notify_api_version' => :'String',
        :'expires_date' => :'DateTime',
        :'attachment_urls' => :'Array<String>',
        :'bank' => :'String',
        :'bank_id' => :'String',
        :'payer_name' => :'String',
        :'payer_email' => :'String',
        :'personal_identifier' => :'String',
        :'bank_account_number' => :'String',
        :'out_of_date_conciliation' => :'BOOLEAN',
        :'transaction_id' => :'String',
        :'custom' => :'String',
        :'responsible_user_email' => :'String',
        :'send_reminders' => :'BOOLEAN',
        :'send_email' => :'BOOLEAN'
        
      }
    end

    def initialize(attributes = {})
      return if !attributes.is_a?(Hash) || attributes.empty?

      # convert string to symbol for hash key
      attributes = attributes.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

      
      if attributes[:'payment_id']
        self.payment_id = attributes[:'payment_id']
      end
      
      if attributes[:'payment_url']
        self.payment_url = attributes[:'payment_url']
      end
      
      if attributes[:'simplified_transfer_url']
        self.simplified_transfer_url = attributes[:'simplified_transfer_url']
      end
      
      if attributes[:'transfer_url']
        self.transfer_url = attributes[:'transfer_url']
      end
      
      if attributes[:'app_url']
        self.app_url = attributes[:'app_url']
      end
      
      if attributes[:'ready_for_terminal']
        self.ready_for_terminal = attributes[:'ready_for_terminal']
      end
      
      if attributes[:'notification_token']
        self.notification_token = attributes[:'notification_token']
      end
      
      if attributes[:'receiver_id']
        self.receiver_id = attributes[:'receiver_id']
      end
      
      if attributes[:'conciliation_date']
        self.conciliation_date = attributes[:'conciliation_date']
      end
      
      if attributes[:'subject']
        self.subject = attributes[:'subject']
      end
      
      if attributes[:'amount']
        self.amount = attributes[:'amount']
      end
      
      if attributes[:'currency']
        self.currency = attributes[:'currency']
      end
      
      if attributes[:'status']
        self.status = attributes[:'status']
      end
      
      if attributes[:'status_detail']
        self.status_detail = attributes[:'status_detail']
      end
      
      if attributes[:'body']
        self.body = attributes[:'body']
      end
      
      if attributes[:'picture_url']
        self.picture_url = attributes[:'picture_url']
      end
      
      if attributes[:'receipt_url']
        self.receipt_url = attributes[:'receipt_url']
      end
      
      if attributes[:'return_url']
        self.return_url = attributes[:'return_url']
      end
      
      if attributes[:'cancel_url']
        self.cancel_url = attributes[:'cancel_url']
      end
      
      if attributes[:'notify_url']
        self.notify_url = attributes[:'notify_url']
      end
      
      if attributes[:'notify_api_version']
        self.notify_api_version = attributes[:'notify_api_version']
      end
      
      if attributes[:'expires_date']
        self.expires_date = attributes[:'expires_date']
      end
      
      if attributes[:'attachment_urls']
        if (value = attributes[:'attachment_urls']).is_a?(Array)
          self.attachment_urls = value
        end
      end
      
      if attributes[:'bank']
        self.bank = attributes[:'bank']
      end
      
      if attributes[:'bank_id']
        self.bank_id = attributes[:'bank_id']
      end
      
      if attributes[:'payer_name']
        self.payer_name = attributes[:'payer_name']
      end
      
      if attributes[:'payer_email']
        self.payer_email = attributes[:'payer_email']
      end
      
      if attributes[:'personal_identifier']
        self.personal_identifier = attributes[:'personal_identifier']
      end
      
      if attributes[:'bank_account_number']
        self.bank_account_number = attributes[:'bank_account_number']
      end
      
      if attributes[:'out_of_date_conciliation']
        self.out_of_date_conciliation = attributes[:'out_of_date_conciliation']
      end
      
      if attributes[:'transaction_id']
        self.transaction_id = attributes[:'transaction_id']
      end
      
      if attributes[:'custom']
        self.custom = attributes[:'custom']
      end
      
      if attributes[:'responsible_user_email']
        self.responsible_user_email = attributes[:'responsible_user_email']
      end
      
      if attributes[:'send_reminders']
        self.send_reminders = attributes[:'send_reminders']
      end
      
      if attributes[:'send_email']
        self.send_email = attributes[:'send_email']
      end
      
    end

  end
end
