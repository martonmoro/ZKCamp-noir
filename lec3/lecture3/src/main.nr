use dep::std;

struct Item {
    price: Field,
    quantity: Field,
    cost: Field,
}

impl Item {
    fn check_cost(self) -> bool {
        self.price * self.quantity == self.cost
    }
}

// fn main(price: [Field; 2], quantity: [Field; 2], cost: [Field; 2]) {
//     for i in 0..2 {
//         assert(price[i] * quantity[i] == cost[i]);
//     }
// }
fn main(items: [Item; 2]) {
    assert(items.all(|i: Item| i.check_cost()));
}

#[test]
fn test_main() {
    let item1 = Item {price: 1, quantity: 1, cost: 1};
    let item2 = Item {price: 2, quantity: 6, cost: 12};

    main([item1, item2])
}
