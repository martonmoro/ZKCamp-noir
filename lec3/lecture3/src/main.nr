// use dep::std;

// global RATE_IN_PERCENT = 5;
// global MIN_TAX_TRESHOLD = 8;

// struct Item {
//     price: Field,
//     quantity: Field,
//     cost: Field,
// }

// impl Item {
//     fn check_cost(self) -> bool {
//         self.price * self.quantity == self.cost
//     }
// }

// // fn main(price: [Field; 2], quantity: [Field; 2], cost: [Field; 2]) {
// //     for i in 0..2 {
// //         assert(price[i] * quantity[i] == cost[i]);
// //     }
// // }
// fn main(items: [Item; 2]) -> pub Field {
//     assert(items.all(|i: Item| i.check_cost()));

//     let total = items.fold(0, |x, i: Item| x + i.cost);

//     if (total as u64 > MIN_TAX_TRESHOLD) {
//         total + total * RATE_IN_PERCENT/100
//     } else {
//         total
//     }

// }

// #[test]
// fn test_main() {
//     let item1 = Item { price: 1, quantity: 1, cost: 1 };
//     let item2 = Item { price: 2, quantity: 4, cost: 8 };

//     let total = main([item1, item2]);
//     assert(total == 3283236430775891283336960861788591263282254660062405151554730627986371274352);
// }

// SLICES

// use dep::std;

// fn main() {

//     // initialize
//     let mut slice: [Field] = &[50; 2];

//     // assign
//     slice[0] = 10;

//     // push_back
//     slice = slice.push_back(20);
//     assert(slice.len() == 3);

//     // push_front
//     slice = slice.push_front(10);
//     assert(slice.len() == 4);
//     assert(slice[0] == 10);

//     // pop_back
//     let (slice, _) = slice.pop_back();
//     assert(slice.len() == 3);

//     // pop_front
//     let (elem, mut slice) = slice.pop_front();
//     assert(elem == 10);

//     // insert at index
//     slice = slice.insert(2, 100);
//     assert(slice[2] == 100);

//     // remove at index
//     let (_, removed) = slice.remove(2);
//     assert(removed == 100);

//     // append two slices
//     let append = &[1,2].append(&[3,4,5]);
//     assert(append[0] == 1);
//     assert(append[4] == 5); 
// }

// GENERICS

struct Bar<T> {
    one: Field,
    two: Field,
    other: T
}

impl<T> Bar<T> {
    fn get_other(self) -> T {
        self.other
    }
}

fn main() {
    let bar1 = Bar { one: 1, two: 2, other: 3 }; // noir can infere type
    let bar2: Bar<[Field; 1]> = Bar { one: 1, two: 2, other: [0] };

    // nested generics
    let nested_generics: Bar<Bar<Field>> = Bar { one: 1, two: 2, other: Bar { one: 11, two: 22, other: 33 } };
    assert(bar1.get_other() == bar1.other);
    assert(nested_generics.other.other == bar1.get_other());
}
