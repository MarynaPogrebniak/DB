//В рамках БД интернет-магазин напишите след/запросы:

//Вывести названия товаров от 50 до 500 EUR
db.products.find(
    { price: { $gte: 50, $lte: 500 } },
    { title: 1, _id : 0}
)

//Применить скидку в размере 10% к товарам от 50 EUR
db.products.updateMany(
    {price : { $gte : 50}},
    { $mul: { price: .9 } }
)

//Применить ко всем товарам наценку в размере 5%
db.products.updateMany(
    {},
    { $mul: { price: 1.05 } }
)
//Заблокировать юзеров не из USA
db.users.updateMany(
    { country :  {$ne : 'USA'}},
    { $set: { is_blocked: true } }
)
//Вывести имена незаблокированных юзеров
db.users.find(
    { is_blocked: { $ne : true } },
    { fullname : 1, _id : 0}
)