#!/usr/bin/env -S cargo +nightly -Zscript
use std::io::{self, BufRead};

#[derive(Debug)]
struct VM {
    a: i64,
    b: i64,
    c: i64,
    ip: usize,
    prg: Vec<i64>,
    out: Vec<i64>,
}

impl VM {
    fn combo_value(&self, operand: i64) -> i64 {
        match operand {
            0..4 => operand,
            4 => self.a,
            5 => self.b,
            6 => self.c,
            _ => unreachable!(),
        }
    }

    fn div(&self, operand: i64) -> i64 {
        let denominator = i64::pow(2, self.combo_value(operand) as u32);
        self.a / denominator
    }

    fn cycle(&mut self) {
        let opcode = self.prg[self.ip];
        let operand = self.prg[self.ip + 1];
        match opcode {
            0 => self.a = self.div(operand),
            1 => self.b ^= operand,
            2 => self.b = self.combo_value(operand) & 7,
            3 => match self.a {
                0 => {}
                _ => self.ip = operand as usize,
            },
            4 => self.b ^= self.c,
            5 => self.out.push(self.combo_value(operand) & 7),
            6 => self.b = self.div(operand),
            7 => self.c = self.div(operand),
            _ => unreachable!(),
        };

        if opcode != 3 || self.a == 0 {
            self.ip += 2;
        }
        // println!("{:?}", self);
    }

    pub fn run(&mut self) {
        while self.ip < self.prg.len() - 1 {
            self.cycle();
        }
    }
}

fn parse_ints(line: Result<String, std::io::Error>) -> Vec<i64> {
    match line {
        Ok(s) => s
            .split(|c| !char::is_numeric(c))
            .filter(|s| !s.is_empty())
            .map(|s| s.parse::<i64>().expect("failed to parse int"))
            .collect(),
        _ => vec![],
    }
}

fn main() {
    let stdin = io::stdin();
    let lines = stdin.lock().lines();
    let data: Vec<Vec<i64>> = lines.map(parse_ints).collect();

    match data.iter().map(Vec::as_slice).collect::<Vec<&[i64]>>()[..] {
        [[a], [b], [c], [], prg] => {
            let mut vm = VM {
                a: *a,
                b: *b,
                c: *c,
                ip: 0,
                prg: prg.to_vec(),
                out: vec![],
            };
            vm.run();
            println!(
                "{}",
                vm.out
                    .iter()
                    .map(|n| n.to_string())
                    .collect::<Vec<String>>()
                    .join(",")
            );
            println!("{:?}", prg.to_vec());
            println!("{}", star2(prg.to_vec()).unwrap());
        }
        _ => panic!("invalid input!"),
    };
}

// manually disassembled logic
fn star2_step(a: i64) -> i64 {
    let mut b = a & 7;
    b = b ^ 5;
    let c = a / i64::pow(2, b as u32);
    b = b ^ 6;
    b = b ^ c;
    b & 7
}
fn star2_recur(a_: i64, out: &[i64]) -> Option<i64> {
    match out {
        [] => Some(a_),
        _ => {
            let head = out.first().unwrap();
            let a = 8 * a_;
            let mut ans: Option<i64> = None;

            for i in 0..8 {
                let x = star2_step(a + i);
                if x == *head {
                    // println!("{} ~ {}", a + i, head);
                    if let Some(n) = star2_recur(a + i, &out[1..]) {
                        ans = Some(n);
                        break;
                    }
                }
            }
            ans
        }
    }
}

fn star2(prg: Vec<i64>) -> Option<i64> {
    let rev: Vec<i64> = prg.iter().rev().copied().collect();

    star2_recur(0, &rev[..])
}
