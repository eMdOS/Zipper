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

// MARK: - Zip 3

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

// MARK: - Zip 4

public func zip<A, B, C, D, Error>(
    _ a: Result<A, Error>,
    _ b: Result<B, Error>,
    _ c: Result<C, Error>,
    _ d: Result<D, Error>
) -> Result<(A, B, C, D), Error> {
    zip(zip(a, b), c, d)
        .map { ($0.0, $0.1, $1, $2) }
}

public func zip<A, B, C, D, Value, Error>(
    with transform: @escaping (A, B, C, D) -> Value
) -> (Result<A, Error>, Result<B, Error>, Result<C, Error>, Result<D, Error>) -> Result<Value, Error> {
    { a, b, c, d in
        zip(a, b, c, d).map(transform)
    }
}

// MARK: - Zip 5

public func zip<A, B, C, D, E, Error>(
    _ a: Result<A, Error>,
    _ b: Result<B, Error>,
    _ c: Result<C, Error>,
    _ d: Result<D, Error>,
    _ e: Result<E, Error>
) -> Result<(A, B, C, D, E), Error> {
    zip(zip(a, b), c, d, e)
        .map { ($0.0, $0.1, $1, $2, $3) }
}

public func zip<A, B, C, D, E, Value, Error>(
    with transform: @escaping (A, B, C, D, E) -> Value
) -> (Result<A, Error>, Result<B, Error>, Result<C, Error>, Result<D, Error>, Result<E, Error>) -> Result<Value, Error> {
    { a, b, c, d, e in
        zip(a, b, c, d, e).map(transform)
    }
}

// MARK: - Zip 6

public func zip<A, B, C, D, E, F, Error>(
    _ a: Result<A, Error>,
    _ b: Result<B, Error>,
    _ c: Result<C, Error>,
    _ d: Result<D, Error>,
    _ e: Result<E, Error>,
    _ f: Result<F, Error>
) -> Result<(A, B, C, D, E, F), Error> {
    zip(zip(a, b), c, d, e, f)
        .map { ($0.0, $0.1, $1, $2, $3, $4) }
}

public func zip<A, B, C, D, E, F, Value, Error>(
    with transform: @escaping (A, B, C, D, E, F) -> Value
) -> (Result<A, Error>, Result<B, Error>, Result<C, Error>, Result<D, Error>, Result<E, Error>, Result<F, Error>) -> Result<Value, Error> {
    { a, b, c, d, e, f in
        zip(a, b, c, d, e, f).map(transform)
    }
}
