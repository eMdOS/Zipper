// MARK: - Zip 2

public func zip<A, B>(
    _ a: A?,
    _ b: B?
) -> (A, B)? {
    switch (a, b) {
    case let (.some(a), .some(b)):
        return .some((a, b))
    case (.none, _), (_, .none):
        return nil
    }
}

public func zip<A, B, Value>(
    with transform: @escaping (A, B) -> Value
) -> (A?, B?) -> Value? {
    { a, b in
        zip(a, b).map(transform)
    }
}

// MARK: - Zip 3

public func zip<A, B, C>(
    _ a: A?,
    _ b: B?,
    _ c: C?
) -> (A, B, C)? {
    zip(zip(a, b), c)
        .map { ($0.0, $0.1, $1) }
}

public func zip<A, B, C, Value>(
    with transform: @escaping (A, B, C) -> Value
) -> (A?, B?, C?) -> Value? {
    { a, b, c in
        zip(a, b, c).map(transform)
    }
}

// MARK: - Zip 4

public func zip<A, B, C, D>(
    _ a: A?,
    _ b: B?,
    _ c: C?,
    _ d: D?
) -> (A, B, C, D)? {
    zip(zip(a, b), c, d)
        .map { ($0.0, $0.1, $1, $2) }
}

public func zip<A, B, C, D, Value>(
    with transform: @escaping (A, B, C, D) -> Value
) -> (A?, B?, C?, D?) -> Value? {
    { a, b, c, d in
        zip(a, b, c, d).map(transform)
    }
}

// MARK: - Zip 5

public func zip<A, B, C, D, E>(
    _ a: A?,
    _ b: B?,
    _ c: C?,
    _ d: D?,
    _ e: E?
) -> (A, B, C, D, E)? {
    zip(zip(a, b), c, d, e)
        .map { ($0.0, $0.1, $1, $2, $3) }
}

public func zip<A, B, C, D, E, Value>(
    with transform: @escaping (A, B, C, D, E) -> Value
) -> (A?, B?, C?, D?, E?) -> Value? {
    { a, b, c, d, e in
        zip(a, b, c, d, e).map(transform)
    }
}

// MARK: - Zip 6

public func zip<A, B, C, D, E, F>(
    _ a: A?,
    _ b: B?,
    _ c: C?,
    _ d: D?,
    _ e: E?,
    _ f: F?
) -> (A, B, C, D, E, F)? {
    zip(zip(a, b), c, d, e, f)
        .map { ($0.0, $0.1, $1, $2, $3, $4) }
}

public func zip<A, B, C, D, E, F, Value>(
    with transform: @escaping (A, B, C, D, E, F) -> Value
) -> (A?, B?, C?, D?, E?, F?) -> Value? {
    { a, b, c, d, e, f in
        zip(a, b, c, d, e, f).map(transform)
    }
}
