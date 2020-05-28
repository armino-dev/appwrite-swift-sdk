/// Swift Appwrite SDK
/// Produced by Appwrite SDK Generator
///

# Database Service

## List Documents

```http request
GET https://appwrite.io/v1/database/collections/{collectionId}/documents
```

** Get a list of all the user documents. You can use the query params to filter your results. On admin mode, this endpoint will return a list of all of the project documents. [Learn more about different API modes](/docs/admin). **

### Parameters

| Field Name | Type | Description | Default |
| --- | --- | --- | --- |
| collectionId | string | **Required** Collection unique ID. You can create a new collection with validation rules using the Database service [server integration](/docs/database?platform=server#createCollection). |  |
| filters | array | Array of filter strings. Each filter is constructed from a key name, comparison operator (=, !=, &gt;, &lt;, &lt;=, &gt;=) and a value. You can also use a dot (.) separator in attribute names to filter by child document attributes. Examples: &#039;name=John Doe&#039; or &#039;category.$id&gt;=5bed2d152c362&#039;. | [] |
| offset | integer | Offset value. Use this value to manage pagination. | 0 |
| limit | integer | Maximum number of documents to return in response.  Use this value to manage pagination. | 50 |
| orderField | string | Document field that results will be sorted by. | $id |
| orderType | string | Order direction. Possible values are DESC for descending order, or ASC for ascending order. | ASC |
| orderCast | string | Order field type casting. Possible values are int, string, date, time or datetime. The database will attempt to cast the order field to the value you pass here. The default value is a string. | string |
| search | string | Search query. Enter any free text search. The database will try to find a match against all document attributes and children. |  |
| first | integer | Return only the first document. Pass 1 for true or 0 for false. The default value is 0. | 0 |
| last | integer | Return only the last document. Pass 1 for true or 0 for false. The default value is 0. | 0 |

## Create Document

```http request
POST https://appwrite.io/v1/database/collections/{collectionId}/documents
```

** Create a new Document. **

### Parameters

| Field Name | Type | Description | Default |
| --- | --- | --- | --- |
| collectionId | string | **Required** Collection unique ID. You can create a new collection with validation rules using the Database service [server integration](/docs/database?platform=server#createCollection). |  |
| data | object | Document data as JSON object. |  |
| read | array | An array of strings with read permissions. By default no user is granted with any read permissions. [learn more about permissions](/docs/permissions) and get a full list of available permissions. |  |
| write | array | An array of strings with write permissions. By default no user is granted with any write permissions. [learn more about permissions](/docs/permissions) and get a full list of available permissions. |  |
| parentDocument | string | Parent document unique ID. Use when you want your new document to be a child of a parent document. |  |
| parentProperty | string | Parent document property name. Use when you want your new document to be a child of a parent document. |  |
| parentPropertyType | string | Parent document property connection type. You can set this value to **assign**, **append** or **prepend**, default value is assign. Use when you want your new document to be a child of a parent document. | assign |

## Get Document

```http request
GET https://appwrite.io/v1/database/collections/{collectionId}/documents/{documentId}
```

** Get document by its unique ID. This endpoint response returns a JSON object with the document data. **

### Parameters

| Field Name | Type | Description | Default |
| --- | --- | --- | --- |
| collectionId | string | **Required** Collection unique ID. You can create a new collection with validation rules using the Database service [server integration](/docs/database?platform=server#createCollection). |  |
| documentId | string | **Required** Document unique ID. |  |

## Update Document

```http request
PATCH https://appwrite.io/v1/database/collections/{collectionId}/documents/{documentId}
```

### Parameters

| Field Name | Type | Description | Default |
| --- | --- | --- | --- |
| collectionId | string | **Required** Collection unique ID. You can create a new collection with validation rules using the Database service [server integration](/docs/database?platform=server#createCollection). |  |
| documentId | string | **Required** Document unique ID. |  |
| data | object | Document data as JSON object. |  |
| read | array | An array of strings with read permissions. By default no user is granted with any read permissions. [learn more about permissions](/docs/permissions) and get a full list of available permissions. |  |
| write | array | An array of strings with write permissions. By default no user is granted with any write permissions. [learn more about permissions](/docs/permissions) and get a full list of available permissions. |  |

## Delete Document

```http request
DELETE https://appwrite.io/v1/database/collections/{collectionId}/documents/{documentId}
```

** Delete document by its unique ID. This endpoint deletes only the parent documents, his attributes and relations to other documents. Child documents **will not** be deleted. **

### Parameters

| Field Name | Type | Description | Default |
| --- | --- | --- | --- |
| collectionId | string | **Required** Collection unique ID. You can create a new collection with validation rules using the Database service [server integration](/docs/database?platform=server#createCollection). |  |
| documentId | string | **Required** Document unique ID. |  |

