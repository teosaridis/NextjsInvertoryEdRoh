"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const userController_1 = require("../controllers/userController");
const usersRoutes = (0, express_1.Router)();
usersRoutes.get("/", userController_1.getUsers);
exports.default = usersRoutes;
