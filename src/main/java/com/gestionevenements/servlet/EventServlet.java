package com.gestionevenements.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import com.gestionevenements.model.Event;
import com.gestionevenements.service.EventService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/events")
public class EventServlet extends HttpServlet {
    private final String LIST_VIEW = "/WEB-INF/views/evenement.jsp";
    private final String DETAIL_VIEW = "/WEB-INF/views/evenement-detail.jsp";

    private final EventService service = new EventService();

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String idParam = req.getParameter("id");

        if (idParam == null || idParam.isBlank()) {
            List<Event> events = service.listEvents();
            req.setAttribute("events", events);
            req.getRequestDispatcher(LIST_VIEW).forward(req, res);
            return;
        }

        int id = Integer.parseInt(idParam.trim());
        Optional<Event> event = service.findById(id);
        if (event.isEmpty()) {
            res.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        req.setAttribute("event", event.get());
        req.getRequestDispatcher(DETAIL_VIEW).forward(req, res);
    }
}
