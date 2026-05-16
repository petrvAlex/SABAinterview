# XSD (XML Schema Definition)

**XSD (XML Schema Definition)** — это язык определения схемы, используемый для **описания структуры, типов данных и ограничений XML-документов**.

  
С помощью XSD можно строго определить, какие элементы и атрибуты допустимы в XML, их типы, вложенность, повторяемость и т.д.

---

## Зачем нужен XSD?

- Проверка (валидация) XML-документов на соответствие требованиям.
    
- Обеспечение совместимости при обмене данными между системами.
    
- Документирование формата XML.
    
- Защита от ошибок при импорте, экспорте и обработке данных.

---

## Пример XML и XSD

  

### XML:

```
<user>
    <id>42</id>
    <name>Alice</name>
    <email>alice@example.com</email>
</user>
```

### Соответствующий XSD:

```
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xs:element name="user">
    <xs:complexType>
      <xs:sequence>
        <xs:element name="id" type="xs:integer"/>
        <xs:element name="name" type="xs:string"/>
        <xs:element name="email" type="xs:string"/>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
</xs:schema>
```


---

## Основные конструкции XSD

|**Конструкция**|**Назначение**|
|---|---|
|xs:element|Определяет элемент XML|
|xs:attribute|Определяет атрибут элемента|
|xs:complexType|Определяет сложную структуру (элементы внутри)|
|xs:simpleType|Определяет простой тип (строка, число и т.д.)|
|xs:sequence|Указывает порядок элементов|
|xs:choice|Один из нескольких вариантов|
|xs:restriction|Ограничения на значения (длина, диапазон, шаблон)|
|xs:minOccurs / maxOccurs|Минимальное/максимальное количество повторений|

  

---

### Примеры ограничений


#### Строка с ограничением длины:

```
<xs:element name="code">
  <xs:simpleType>
    <xs:restriction base="xs:string">
      <xs:minLength value="3"/>
      <xs:maxLength value="10"/>
    </xs:restriction>
  </xs:simpleType>
</xs:element>
```

#### Перечисление допустимых значений:

```
<xs:element name="status">
  <xs:simpleType>
    <xs:restriction base="xs:string">
      <xs:enumeration value="new"/>
      <xs:enumeration value="in_progress"/>
      <xs:enumeration value="done"/>
    </xs:restriction>
  </xs:simpleType>
</xs:element>
```
  

---

### Поддерживаемые типы данных

- xs:string, xs:boolean, xs:decimal, xs:integer, xs:date, xs:dateTime, xs:time
- Можно создавать **собственные типы** на основе базовых с ограничениями.

---

## Где используется

- В B2B-интеграциях, банковских системах, госуслугах.
- В SOAP-сервисах для строгой спецификации XML-сообщений.
- В системах документооборота (EDI, УПД, счета-фактуры).

---

## Полезные ресурсы {#resources}

### Дополнительные материалы {#additional-materials}

- Валидация: [https://www.freeformatter.com/xml-validator-xsd.html](https://www.freeformatter.com/xml-validator-xsd.html)
- Генерация схем: [https://www.liquid-technologies.com/xsd-schema-editor](https://www.liquid-technologies.com/xsd-schema-editor)
