import { Router } from "express";
import { getDashboardMetrics } from "../controllers/dashboardController";

const router = Router();

// router.get("/metrics", getDashboardMetrics); http://localhost:8000/dashboard/metrics

router.get("/", getDashboardMetrics);


export default router;
