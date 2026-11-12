package com.gestionevenements.service;

import java.util.List;
import java.util.Optional;

import com.gestionevenements.dao.EventDao;
import com.gestionevenements.model.Event;

public class EventService {
    private final EventDao dao = new EventDao();

    public List<Event> listEvents() {
        return dao.findAll();
    }

    public Optional<Event> findById(int id) {
        return dao.find(id);
    }
}
