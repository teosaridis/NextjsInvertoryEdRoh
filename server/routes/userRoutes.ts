import { Router } from "express";
import { getUsers } from "../controllers/userController";

const usersRoutes = Router();

usersRoutes.get("/", getUsers);

export default usersRoutes;
