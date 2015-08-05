describe "about Order", (done) ->
  it "create Order should be success.", (done) ->
    newOrder = {
      quantity: 10

      product: {
        name: '柚子'
        descript: '又大又好吃'
        price: 100
        stockQuantity: 10
        id: 1
      }

      user: {
        email: 'test@gmail.com'
        mobile: '0911-111-111'
        address: ''
        username: 'test'
      }
    }

    request(sails.hooks.http.app)
    .post("/order")
    .send(newOrder)
    .end (err, res) ->
      return done(body) if res.statusCode is 500
      res.body.success.should.be.true
      res.body.order.id.should.be.number

      done(err)

  describe.only "get Order status.", () ->
    before (done) ->

      newUser = {
        username: "testOrderUser"
        email: "testOrderUser@gmail.com"
        password: "testuser"
      }

      console.log '=== before test create newUser==='
      db.User.create(newUser).then (newUser) ->
        console.log '=== create newOrder ==='

        newOrder = {
          quantity:10
          serialnumber:'11223344'
          UserId:newUser.id
        }

        db.Order.create(newOrder).then (createdOrder) ->
          createdOrder.orderId.should.be.String
          done()


    it "get Order status should be success.", (done) ->

      formdata = {
        orderId: '11223344'
        email: 'testOrderUser@gmail.com'
      }

      request(sails.hooks.http.app)
      .post("/order/status")
      .send(formdata)
      .end (err, res) ->
        return done(body) if res.statusCode is 500
        res.body.order.id.should.be.number

        done(err)
