import { gql } from "@apollo/client";
import * as Apollo from "@apollo/client";
import {
  FieldPolicy,
  FieldReadFunction,
  TypePolicies,
  TypePolicy,
} from "@apollo/client/cache";
export type Maybe<T> = T | null;
export type Exact<T extends { [key: string]: unknown }> = {
  [K in keyof T]: T[K];
};
export type MakeOptional<T, K extends keyof T> = Omit<T, K> & {
  [SubKey in K]?: Maybe<T[SubKey]>;
};
export type MakeMaybe<T, K extends keyof T> = Omit<T, K> & {
  [SubKey in K]: Maybe<T[SubKey]>;
};
const defaultOptions = {};
/** All built-in and custom scalars, mapped to their actual values */
export type Scalars = {
  ID: string;
  String: string;
  Boolean: boolean;
  Int: number;
  Float: number;
  Date: any;
};

export type Query = {
  __typename?: "Query";
  local?: Maybe<Local>;
};

export type Local = {
  __typename?: "Local";
  token?: Maybe<Scalars["String"]>;
};

export type TokenQueryVariables = Exact<{ [key: string]: never }>;

export type TokenQuery = {
  __typename?: "Query";
  local?:
    | { __typename?: "Local"; token?: string | null | undefined }
    | null
    | undefined;
};

export const TokenDocument = gql`
  query token {
    local {
      token
    }
  }
`;

/**
 * __useTokenQuery__
 *
 * To run a query within a React component, call `useTokenQuery` and pass it any options that fit your needs.
 * When your component renders, `useTokenQuery` returns an object from Apollo Client that contains loading, error, and data properties
 * you can use to render your UI.
 *
 * @param baseOptions options that will be passed into the query, supported options are listed on: https://www.apollographql.com/docs/react/api/react-hooks/#options;
 *
 * @example
 * const { data, loading, error } = useTokenQuery({
 *   variables: {
 *   },
 * });
 */
export function useTokenQuery(
  baseOptions?: Apollo.QueryHookOptions<TokenQuery, TokenQueryVariables>
) {
  const options = { ...defaultOptions, ...baseOptions };
  return Apollo.useQuery<TokenQuery, TokenQueryVariables>(
    TokenDocument,
    options
  );
}
export function useTokenLazyQuery(
  baseOptions?: Apollo.LazyQueryHookOptions<TokenQuery, TokenQueryVariables>
) {
  const options = { ...defaultOptions, ...baseOptions };
  return Apollo.useLazyQuery<TokenQuery, TokenQueryVariables>(
    TokenDocument,
    options
  );
}
export type TokenQueryHookResult = ReturnType<typeof useTokenQuery>;
export type TokenLazyQueryHookResult = ReturnType<typeof useTokenLazyQuery>;
export type TokenQueryResult = Apollo.QueryResult<
  TokenQuery,
  TokenQueryVariables
>;
export type QueryKeySpecifier = ("local" | QueryKeySpecifier)[];
export type QueryFieldPolicy = {
  local?: FieldPolicy<any> | FieldReadFunction<any>;
};
export type LocalKeySpecifier = ("token" | LocalKeySpecifier)[];
export type LocalFieldPolicy = {
  token?: FieldPolicy<any> | FieldReadFunction<any>;
};
export type StrictTypedTypePolicies = {
  Query?: Omit<TypePolicy, "fields" | "keyFields"> & {
    keyFields?:
      | false
      | QueryKeySpecifier
      | (() => undefined | QueryKeySpecifier);
    fields?: QueryFieldPolicy;
  };
  Local?: Omit<TypePolicy, "fields" | "keyFields"> & {
    keyFields?:
      | false
      | LocalKeySpecifier
      | (() => undefined | LocalKeySpecifier);
    fields?: LocalFieldPolicy;
  };
};
export type TypedTypePolicies = StrictTypedTypePolicies & TypePolicies;
