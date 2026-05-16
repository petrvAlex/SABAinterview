# JSON Schema 

**JSON Schema** — это формат для **описания структуры, содержимого и ограничений JSON-документов**.

Служит для **валидации данных**, автогенерации форм, документации API и повышения надёжности обмена данными.

---

### Зачем нужен JSON Schema?

- Проверка, что JSON соответствует ожидаемой структуре.
    
- Определение обязательных и необязательных полей.
    
- Ограничение типов значений, допустимых диапазонов, шаблонов и т.д.
    
- Автогенерация UI-форм (например, в Swagger, React JSON Schema Form).
    
- Улучшение взаимодействия между системами и API.

---

### Пример JSON и соответствующей схемы

#### JSON:

```
{
  "id": 1,
  "name": "Alice",
  "email": "alice@example.com",
  "age": 30
}
```

#### JSON Schema:

```
{
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "type": "object",
  "properties": {
    "id":    { "type": "integer" },
    "name":  { "type": "string" },
    "email": { "type": "string", "format": "email" },
    "age":   { "type": "integer", "minimum": 0 }
  },
  "required": ["id", "name", "email"]
}
```

---

### Основные ключи в JSON Schema

|**Ключ**|**Назначение**|
|---|---|
|type|Ожидаемый тип: object, array, string, integer и др.|
|properties|Описание полей объекта|
|required|Список обязательных полей|
|minimum / maximum|Числовые границы|
|minLength / maxLength|Ограничения длины строк|
|pattern|Регулярное выражение для строки|
|enum|Перечисление допустимых значений|
|items|Описание элементов массива|
|format|Специальный формат: email, date-time, uri и др.|

  

---

### Варианты использования

- **API-документация** (например, OpenAPI/Swagger использует JSON Schema).
    
- **Валидация входных данных** на сервере или клиенте.
    
- **Генерация UI-форм** (например, React JSON Schema Form).
    
- **Тестирование** — проверка, что JSON-ответы соответствуют ожидаемой структуре.

---

### Примеры ограничений

```
{
  "type": "string",
  "minLength": 3,
  "maxLength": 10,
  "pattern": "^[A-Z][a-z]+$"
}
```

Строка от 3 до 10 символов, начинается с заглавной буквы, затем строчные.

---

### Полезные ресурсы {#resources}

### Дополнительные материалы {#additional-materials}

- [https://json-schema.org](https://json-schema.org)
- Валидация: [https://www.jsonschemavalidator.net](https://www.jsonschemavalidator.net)
- Генерация схемы: [https://jsonschema.dev](https://jsonschema.dev)
