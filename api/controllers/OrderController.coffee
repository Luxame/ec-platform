OrderController =
  create: (req, res) ->

    # 1. 透過 Productid 找到 model product
    # 2. 檢查 user 是否存在，若否進行建立
    # 3. 建立訂單 order

    order = {
      id: '11223344'
      quantity: 10

      user: {
        username: 'test'
        email: 'test@gmail.com'
        mobile: '0911-111-111'
        address: '台灣省台灣市台灣路'
      }

      product: {
        name: '柚子'
        descript: '又大又好吃'
        stockQuantity: 10
        price: 100
        serialnumber: 1
      }
    }

    success = true

    res.ok {
      order: order
      success: success
    }
  status:  (req, res) ->
    console.log req.body.serialnumber
    console.log req.body.email

  serialnumber::yyyymmddxxxx = ->
    yyyy = @getFullYear().toString()
    mm = (@getMonth() + 1).toString()
    dd = @getDate().toString()
    xxxx = (maxNum = 9999, minNum = 0000, n = Math.usefloor(Math.random() * (maxNum - minNum + 1)) + minNum)
    return yyyy + (if mm[1] then mm else '0' + mm[0]) + (if dd[1] then dd else '0' + dd[0])+(if xxxx[0] then xxxx else '0' + xxxx[0])

    db.User.findOne(
      where:
        email:req.body.email
    )
    .then (userData) ->
      return res.ok {msg: '沒有此User' } if userData is null

      db.Order.findOne(
        where:
          serialnumber:req.body.serialnumber
          UserId:userData.id
      )
      .then (orderProduct) ->
        if orderProduct?
          order = {
              serialnumber: orderProduct.serialnumber
              quantity: orderProduct.quantity
              user: {
                username: userData.username
                email: userData.email
                mobile: userData.mobile
                address: userData.address
              }
            }
          res.ok { order : order }
        else
          #沒有此訂單編號時在這處理
          res.ok { msg: '沒有此訂單' }






module.exports = OrderController
