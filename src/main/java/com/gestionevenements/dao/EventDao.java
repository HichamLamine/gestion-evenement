package com.gestionevenements.dao;

import java.util.List;
import java.util.Optional;

import org.hibernate.SessionFactory;

import com.gestionevenements.model.Event;
import com.gestionevenements.util.HibernateUtil;

public class EventDao {
    private final SessionFactory sf = HibernateUtil.get();

    public List<Event> findAll() {
        return sf.fromSession(s ->
            s.createQuery("from Event e order by e.date", Event.class).list());
    }

    public Optional<Event> find(int id) {
        return sf.fromSession(s -> Optional.ofNullable(s.find(Event.class, id)));
    }

    public void save(Event e) {
        sf.inTransaction(s -> s.persist(e));
    }

    public long count() {
        return sf.fromSession(s ->
            s.createQuery("select count(e) from Event e", Long.class).getSingleResult());
    }
}
