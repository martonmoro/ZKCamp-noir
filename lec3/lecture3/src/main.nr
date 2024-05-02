use dep::std;

global RATE_IN_PERCENT = 5;
global MIN_TAX_TRESHOLD = 8;

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
fn main(items: [Item; 2]) -> pub Field {
    assert(items.all(|i: Item| i.check_cost()));

    let total = items.fold(0, |x, i: Item| x + i.cost);

    if (total as u64 > MIN_TAX_TRESHOLD) {
        total + total * RATE_IN_PERCENT/100
    } else {
        total
    }

    
    
}

#[test]
fn test_main() {
    let item1 = Item { price: 1, quantity: 1, cost: 1 };
    let item2 = Item { price: 2, quantity: 4, cost: 8 };

    let total = main([item1, item2]);
    assert(total == 3283236430775891283336960861788591263282254660062405151554730627986371274352);
}
