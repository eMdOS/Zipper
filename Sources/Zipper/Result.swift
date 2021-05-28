// MARK: - Zip 2

public func zip<A, B, Error>(
    _ a: Result<A, Error>,
    _ b: Result<B, Error>
) -> Result<(A, B), Error> {
    switch (a, b) {
    case let (.success(a), .success(b)):
        return .success((a, b))
    case let (.failure(error), _), let (_, .failure(error)):
        return .failure(error)
    }
}

public func zip<A, B, Value, Error>(
    with transform: @escaping (A, B) -> Value
) -> (Result<A, Error>, Result<B, Error>) -> Result<Value, Error> {
    { a, b in
        zip(a, b).map(transform)
    }
}

// MARK: Zip 3

public func zip<A, B, C, Error>(
    _ a: Result<A, Error>,
    _ b: Result<B, Error>,
    _ c: Result<C, Error>
) -> Result<(A, B, C), Error> {
    zip(zip(a, b), c)
        .map { ($0.0, $0.1, $1) }
}

public func zip<A, B, C, Value, Error>(
    with transform: @escaping (A, B, C) -> Value
) -> (Result<A, Error>, Result<B, Error>, Result<C, Error>) -> Result<Value, Error> {
    { a, b, c in
        zip(a, b, c).map(transform)
    }
}
