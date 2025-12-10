import type { Value } from "./runtime.ts"
import type { Expr, Stmt, Prog } from "./tree.ts"

export type Env = Record<string, Value>

export function extendEnv(
    env: Env,
    name: string,
    value: Value
): Env {
    return { ...env, [name]: value }
}

export function lookupEnv(
    env: Env,
    name: string
): Value | undefined {
    return env[name]
}

export function interpret(prog: Prog): void {
    const env: Env = {}
    for (const stmt of prog) {
        execute(stmt, env);
    }
}

export function execute(stmt: Stmt, env: Env): void {

    switch (stmt.type) {
        case 'Assignement': 
            env[stmt.name] = evaluate(stmt.value, env);
            break;
        case 'Sequence':
            execute(stmt.first, env);
            execute(stmt.second, env);
            break;
        case 'If':
            const cond = evaluate(stmt.condition, env);
            if (cond.type !== 'Boolean') {
                throw new Error(`If condition must evaluate to a Boolean.`)
            }
            if (cond.value) {
                execute(stmt.thenn, env);
            } else if (stmt.elze) {
                execute(stmt.elze, env);
            }
            break;
        case 'While':
            while (true) {
                const condition = evaluate(stmt.condition, env);
                if (condition.type !== 'Boolean') {
                    throw new Error(`While condition must evaluate to a Boolean.`)
                }
                if (!condition.value) {
                    break;
                }
                execute(stmt.body, env);
            }
            break;
    }
}

export function evaluate(expr: Expr, env: Env): Value {
    switch (expr.type) {
        case 'Boolean':
            return { type: 'Boolean', value: expr.value }
        case 'Number':
            return { type: 'Number', value: expr.value }
        case 'Identifier': {
            const value = lookupEnv(env, expr.name)
            if (value === undefined) {
                throw new Error(`Undefined identifier: ${expr.name}`)
            }
            return value
        }
        case 'Unary':
            const value = evaluate(expr.operand, env);
            switch (expr.operator) {
                case '-':
                    if (value.type !== 'Number') {
                        throw new Error(`Unary '-' operator requires a Number operand.`)
                    }
                    return { type: 'Number', value: -value.value }
                case '!':
                    if (value.type !== 'Boolean') {
                        throw new Error(`Unary '!' operator requires a Boolean operand.`)
                    }
                    return { type: 'Boolean', value: !value.value }
            }
        case 'Binary':
            const lhs = evaluate(expr.left, env)
            const rhs = evaluate(expr.right, env)

            if (lhs.type !== 'Number' || rhs.type !== 'Number') {
                throw new Error(`Binary operator '${expr.operator}' requires Number operands.`)
            }

            switch (expr.operator) {
                case '+':
                    return { type: 'Number', value: lhs.value + rhs.value }
                case '-':
                    return { type: 'Number', value: lhs.value - rhs.value }
                case '*':
                    return { type: 'Number', value: lhs.value * rhs.value }

        }
    }
}