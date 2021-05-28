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

// MARK: Zip 3

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
