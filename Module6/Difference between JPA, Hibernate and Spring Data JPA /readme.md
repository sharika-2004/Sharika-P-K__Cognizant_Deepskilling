# Hands-on 4: Difference between JPA, Hibernate and Spring Data JPA

## Objective

Understand the differences between Java Persistence API (JPA), Hibernate, and Spring Data JPA.

---

# Java Persistence API (JPA)

## Definition

Java Persistence API (JPA) is a Java specification (JSR 338) used for persisting, reading, and managing relational data using Java objects.

It only defines standards and interfaces. It does not provide an implementation.

### Features

- Standard ORM specification
- Uses annotations like `@Entity`, `@Id`, `@Table`
- Database independent
- Uses `EntityManager`
- Requires an implementation such as Hibernate

---

# Hibernate

## Definition

Hibernate is an Object Relational Mapping (ORM) framework and one of the most popular implementations of JPA.

It converts Java objects into database tables automatically.

### Features

- Implements JPA
- Automatic SQL generation
- HQL support
- Caching
- Lazy Loading
- Transaction Management

## Hibernate Example

```java
public Integer addEmployee(Employee employee) {
    Session session = factory.openSession();
    Transaction tx = null;
    Integer employeeID = null;

    try {
        tx = session.beginTransaction();
        employeeID = (Integer) session.save(employee);
        tx.commit();
    } catch (HibernateException e) {
        if (tx != null)
            tx.rollback();
        e.printStackTrace();
    } finally {
        session.close();
    }

    return employeeID;
}
```

---

# Spring Data JPA

## Definition

Spring Data JPA is a Spring module built on top of JPA.

It reduces boilerplate code and automatically provides CRUD operations.

### Features

- Repository interfaces
- Automatic CRUD methods
- Query generation
- Pagination
- Sorting
- Transaction management

## Repository

```java
public interface EmployeeRepository extends JpaRepository<Employee, Integer> {

}
```

## Service

```java
@Autowired
private EmployeeRepository employeeRepository;

@Transactional
public void addEmployee(Employee employee) {
    employeeRepository.save(employee);
}
```

---

# Comparison

| Feature | JPA | Hibernate | Spring Data JPA |
|----------|-----|-----------|-----------------|
| Type | Specification | ORM Framework | Spring Module |
| Implementation | ❌ | ✔ | ❌ |
| CRUD | EntityManager | Session | JpaRepository |
| Boilerplate | Medium | High | Very Low |
| Transactions | Manual | Manual | Automatic |
| SQL Generation | Depends on implementation | Automatic | Automatic |
| Ease of Use | Medium | Medium | Easy |

---

# Architecture

```text
Application
     │
     ▼
Spring Data JPA
     │
     ▼
JPA Specification
     │
     ▼
Hibernate
     │
     ▼
Database
```

---

# Advantages

## JPA

- Standard specification
- Database independent
- Portable

## Hibernate

- Powerful ORM
- High performance
- Caching support

## Spring Data JPA

- Less code
- Automatic CRUD
- Repository pattern
- Easy integration with Spring Boot

---

# Conclusion

JPA defines the persistence standard, Hibernate implements the standard, and Spring Data JPA simplifies development by reducing boilerplate code and providing ready-to-use repository interfaces.

---

# References

- https://dzone.com/articles/what-is-the-difference-between-hibernate-and-sprin-1
- https://www.javaworld.com/article/3379043/what-is-jpa-introduction-to-the-java-persistence-api.html
