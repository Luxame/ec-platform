
module.exports = (sequelize, DataTypes) ->
  Order = sequelize.define('Order', {
    serialnumber: DataTypes.STRING
    quantity: DataTypes.INTEGER
  }, classMethods: associate: (models) ->
    Order.belongsTo models.User
    Order.hasOne models.Product
    return
  )
  return Order
