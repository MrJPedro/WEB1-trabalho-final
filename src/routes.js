const { Router } = require("express");
const alunoCont = require('./controllers/alunoController');
const cursoCont = require('./controllers/cursoController');

const routes = Router();

routes.get(["/", "/index"], (req, res) => {
    res.render('index');
})

routes.get("/alunos", alunoCont.index);

routes.get("/alunos/novo", (req, res) => {
    res.render('criar_alunos');
});
routes.get("/alunos/:id", alunoCont.show);

routes.post("/alunos/novo", alunoCont.store);
routes.put("/alunos/:id", alunoCont.update);
routes.delete("/alunos/:id", alunoCont.delete);

routes.get("/cursos", cursoCont.index);
routes.get("/cursos/novo", (req, res) => {
    res.render('criar_cursos')
});
routes.get("/cursos/:id", cursoCont.show);

routes.post("/cursos/novo", cursoCont.store);
routes.put("/cursos/:id", cursoCont.update);
routes.delete("/cursos/:id", cursoCont.delete);

module.exports = routes;