// Lambda calculus parser: <expr> ::= <var> | '(' <expr> <expr> ')' | 'λ' <var> '.' <expr>

class Var { 
    constructor(name) { this.name = name; }
    toString() { return `Var '${this.name}'`; }
}

class Abs { 
    constructor(param, body) { this.param = param; this.body = body; }
    toString() { return `Abs '${this.param}' (${this.body})`; }
}

class App { 
    constructor(func, arg) { this.func = func; this.arg = arg; }
    toString() { return `App (${this.func}) (${this.arg})`; }
}

function parse(input) {
    let i = 0;
    const skip = () => { while (i < input.length && /\s/.test(input[i])) i++; };
    
    const parseVar = () => {
        skip();
        const start = i;
        while (i < input.length && /[a-zA-Z]/.test(input[i])) i++;
        return start < i ? new Var(input.slice(start, i)) : null;
    };
    
    const parseExpr = () => {
        skip();
        if (input[i] === 'λ') {
            i++;
            const param = parseVar().name;
            skip();
            if (input[i++] !== '.') throw new Error("Expected '.' after λ parameter");
            return new Abs(param, parseExpr());
        }
        if (input[i] === '(') {
            i++;
            const func = parseExpr();
            const arg = parseExpr();
            skip();
            if (input[i++] !== ')') throw new Error("Expected ')'");
            return new App(func, arg);
        }
        return parseVar();
    };
    
    const result = parseExpr();
    skip();
    if (i < input.length) throw new Error("Unexpected input at position " + i);
    return result;
}

// Usage: node parser.js "(λx.x z)"
const input = process.argv[2] || "(λx.x z)";
console.log(parse(input).toString());
