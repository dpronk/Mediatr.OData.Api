﻿using Mediatr.OData.Api.Models;
using Microsoft.AspNetCore.OData.Deltas;

namespace Mediatr.OData.Api.Interfaces;

public interface IEndpointPutHandler<TDomainObject, TKey> where TDomainObject : class, IDomainObject<TKey>
{
    Task<Result<dynamic>> Handle(TKey key, Delta<TDomainObject> domainObjectDelta, CancellationToken cancellationToken);
}
