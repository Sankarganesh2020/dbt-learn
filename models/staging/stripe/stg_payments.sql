select 
    ID as payment_id,
    ORDERID as order_id,
    PAYMENTMETHOD as payment_method,
    STATUS,

    -- amount is stored in cents, convert it to dollars
    -- AMOUNT / 100 as amount,

    {{ cents_to_dollars('AMOUNT') }} as amount,
    
    CREATED as created_at
    
    FROM
        {{ source('stripe', 'stripe_payments')}} 
