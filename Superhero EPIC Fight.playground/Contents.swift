import UIKit

// 1შევქმნათ სუპერმტერის კლასი property-თ.
class SuperEnemy {
    var name: String
    var hitPoints: Int
    
    init(name: String, hitPoints: Int) {
        self.name = name
        self.hitPoints = hitPoints
    }
}

// 2. შევქმნათ სუპერგმირის პროტოკოლი
protocol Superhero {
    var name: String { get }
    var alias: String { get }
    var isEvil: Bool { get }
    var superPowers: [String: Int] { get }
    
    func attack(target: SuperEnemy) -> Int
    func performSuperPower(enemy: SuperEnemy) -> Int
}

// 3. შევქმნათ სუპერგმირის ექსთენშენი რომ დაპრინტოს ინფორმაცია სუპერგმირებზე და სუპერძალებზე
extension Superhero {
    func printInfo() {
        print("Superhero Name: \(name)")
        print("Alias: \(alias)")
        print("Is Evil: \(isEvil ? "Yes" : "No")")
        print("Super Powers:")
        for (power, damage) in superPowers {
            print("\(power): Damage \(damage)")
        }
    }
}

// 4. დავაიმპლემენტოთ სპაიდერნანას სტრუქტურა რომელიც ადასტურებს სუპერგმირის პროტოკოლს
struct SpiderNana: Superhero {
    func performSuperPower(enemy: SuperEnemy) -> Int {
        <#code#>
    }
    
    var name: String
    var alias: String
    var isEvil: Bool
    var superPowers: [String: Int]
    
    func attack(target: SuperEnemy) -> Int {
        let damage = Int.random(in: 20...40)
        target.hitPoints -= damage
        return target.hitPoints
    }
    
    mutating func performSuperPower(enemy: SuperEnemy) -> Int {
        if let randomPower = superPowers.keys.randomElement() {
            if let damage = superPowers[randomPower] {
                enemy.hitPoints -= damage
                superPowers[randomPower] = nil
            }
        }
        return enemy.hitPoints
    }
}

// 5. შევქმნათ სუპერსქუადის კლასი რომელშიც არი სუპერგმირების მასივი
class SuperheroSquad<T: Superhero> {
    var superheroes: [T]
    
    init(superheroes: [T]) {
        self.superheroes = superheroes
    }
}

// 6. დავაიმპლიმენტოთ simulateShowdown მეთოდი თუ რაღაც ეგეთი ეს მეთოდები ისე რა მესმის
extension SuperheroSquad {
    func simulateShowdown(enemy: SuperEnemy) {
        while !superheroes.isEmpty && enemy.hitPoints > 0 {
            let randomSuperhero = superheroes.randomElement()!
            randomSuperhero.attack(target: enemy)
            randomSuperhero.performSuperPower(enemy: enemy)
            randomSuperhero.printInfo()
            print("Enemy's Hit Points: \(enemy.hitPoints)\n")
        }
        
        if enemy.hitPoints <= 0 {
            print("The enemy is defeated!")
        } else {
            print("The superheroes ran out of powers. The enemy wins.")
        }
    }
}


let enemy = SuperEnemy(name: "Evil Villain", hitPoints: 100)

let spiderman = SpiderNana(name: "Nana", alias: "Spider-Nana", isEvil: false, superPowers: ["Ios-development": 100, "Spider Sense": 10, "Checking homework": 100])
let superman = SpiderNana(name: "Clark Kent", alias: "Superman", isEvil: false, superPowers: ["Super Strength": 20, "Heat Vision": 25, "Flight": 15])
let batman = SpiderNana(name: "Bruce Wayne", alias: "Batman", isEvil: false, superPowers: ["Riches": 5, "Tech Gadgets": 10, "Martial Arts": 10])

// შევქმნათ ძალიან ეფიქ სუპერგმირების სქუადი
let superheroSquad = SuperheroSquad(superheroes: [spiderman, superman, batman])

// შოუდაუნის სიმულაცია
superheroSquad.simulateShowdown(enemy: enemy)

