fs = require 'fs'
mime = require("mime");
util = require("util")

ProductController =
  findOne: (req, res) ->
    productId = req.param("productId")
    console.log '=== productId ===', productId

    src = __dirname + '/../../assets/images/product/1.jpg';

    data = fs.readFileSync(src).toString("base64");
    base64data = util.format("data:%s;base64,%s", mime.lookup(src), data);

    db.product.findOne(
      name: productdata.name
      descript: productdata.descript
      stockQuantity: productdata.stockQuantity
      price: productdata.price
    ).then(product) -> {
     res.ok {product: product}
    }

module.exports = ProductController
