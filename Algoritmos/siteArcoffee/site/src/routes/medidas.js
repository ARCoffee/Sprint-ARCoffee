var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/ultimas/:idArmazem", function (req, res) {
    medidaController.buscarUltimasMedidas(req, res);
});

router.get("/tempo-real/:idArmazem", function (req, res) {
    medidaController.buscarMedidasEmTempoReal(req, res);
})
router.get("/kpi", function (req, res) {
    medidaController.buscarKPI(req, res);
})
module.exports = router;