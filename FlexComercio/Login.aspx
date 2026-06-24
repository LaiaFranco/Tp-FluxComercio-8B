<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FlexComercio.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Iniciar Sesión - FLUX</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"/>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            overflow: hidden;
        }

        .login-container {
            display: flex;
            min-height: 100vh;
        }

        /* LADO IZQUIERDO - OSCURO CON LOGO */
        .login-left {
            flex: 1;
            background-image: url('fondoFLUX.png');
            background-size: cover;
            background-position: center;
            background-repeat: repeat;
            background-attachment: fixed;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }

        /* Overlay oscuro para mejorar visibilidad del logo */
        .login-left::before {
            content: '';
            position: absolute;
            width: 100%;
            height: 100%;
            background: rgba(13, 15, 26, 0.65);
            pointer-events: none;
        }

        .logo-flux {
            position: relative;
            z-index: 1;
            text-align: center;
            animation: float 3s ease-in-out infinite;
        }

        .logo-flux-icon {
            font-size: 120px;
            color: #bfff00;
            margin-bottom: 20px;
            animation: pulse 2s ease-in-out infinite;
        }

        .logo-flux-text {
            font-size: 48px;
            font-weight: 900;
            color: #bfff00;
            letter-spacing: 2px;
            text-transform: uppercase;
            animation: slideInLeft 0.8s ease-out;
        }

        /* LADO DERECHO - FORMULARIO */
        .login-right {
            flex: 1;
            background: #f5f5f5;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 40px;
        }

        .login-form-wrapper {
            width: 100%;
            max-width: 380px;
            animation: slideInRight 0.8s ease-out;
        }

        .login-title {
            font-size: 36px;
            font-weight: 700;
            color: #1a1f35;
            margin-bottom: 10px;
            text-align: center;
        }

        .login-subtitle {
            font-size: 14px;
            color: #666;
            text-align: center;
            margin-bottom: 30px;
            line-height: 1.6;
        }

        /* CAMPOS DE ENTRADA */
        .form-group {
            margin-bottom: 18px;
            animation: fadeInUp 0.6s ease-out backwards;
        }

        .form-group:nth-child(1) { animation-delay: 0.1s; }
        .form-group:nth-child(2) { animation-delay: 0.2s; }
        .form-group:nth-child(3) { animation-delay: 0.3s; }

        .form-control {
            background: #fff;
            border: 2px solid #e0e0e0;
            border-radius: 50px;
            padding: 14px 20px;
            font-size: 14px;
            color: #333;
            transition: 0.3s ease;
        }

        .form-control::placeholder {
            color: #999;
        }

        .form-control:focus {
            border-color: #bfff00;
            box-shadow: 0 0 0 0.25rem rgba(191, 255, 0, 0.15);
            background: #fff;
            color: #333;
            outline: none;
        }

        /* ENLACE FORGOT PASSWORD */
        .forgot-password {
            text-align: right;
            margin-bottom: 24px;
            animation: fadeInUp 0.6s ease-out 0.4s backwards;
        }

        .forgot-password a {
            font-size: 12px;
            color: #666;
            text-decoration: none;
            transition: 0.2s;
            font-weight: 500;
        }

        .forgot-password a:hover {
            color: #bfff00;
            transform: translateX(2px);
        }

        /* BOTON LOGIN */
        .btn-login {
            width: 100%;
            background-color: #7ec623;
            color: white;
            font-weight: 700;
            border: none;
            border-radius: 50px;
            padding: 14px;
            font-size: 15px;
            cursor: pointer;
            transition: 0.2s;
            margin-bottom: 20px;
            animation: fadeInUp 0.6s ease-out 0.5s backwards;
        }

        .btn-login:hover {
            background-color: #6ab01c;
            transform: scale(1.02);
            box-shadow: 0 6px 20px rgba(124, 198, 35, 0.3);
        }

        .btn-login:active {
            transform: scale(0.98);
        }

        /* ENLACE REGISTER */
        .register-link {
            text-align: center;
            font-size: 13px;
            color: #666;
            margin-bottom: 24px;
            animation: fadeInUp 0.6s ease-out 0.6s backwards;
        }

        .register-link a {
            color: #333;
            text-decoration: none;
            font-weight: 600;
            transition: 0.2s;
        }

        .register-link a:hover {
            color: #bfff00;
        }

        /* SOCIAL ICONS */
        .social-icons {
            display: flex;
            justify-content: center;
            gap: 20px;
            animation: fadeInUp 0.6s ease-out 0.7s backwards;
        }

        .social-icons a {
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #999;
            text-decoration: none;
            border-radius: 50%;
            transition: 0.2s;
            font-size: 18px;
        }

        .social-icons a:hover {
            color: #bfff00;
            background: rgba(191, 255, 0, 0.1);
            transform: translateY(-3px);
        }

        /* ERROR LABEL */
        .error-message {
            background: #fee;
            border: 1px solid #fcc;
            color: #c33;
            padding: 12px 16px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 13px;
            animation: slideDown 0.3s ease-out;
        }

        /* ANIMACIONES */
        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-15px); }
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }

        @keyframes slideInLeft {
            from {
                opacity: 0;
                transform: translateX(-50px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        @keyframes slideInRight {
            from {
                opacity: 0;
                transform: translateX(50px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes slideDown {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* RESPONSIVE */
        @media (max-width: 768px) {
            .login-container {
                flex-direction: column;
            }

            .login-left {
                min-height: 200px;
                padding: 30px;
            }

            .logo-flux-icon {
                font-size: 60px;
            }

            .logo-flux-text {
                font-size: 32px;
            }

            .login-right {
                min-height: auto;
                padding: 30px 20px;
            }

            .login-title {
                font-size: 28px;
            }
        }
    </style>
</head>

<body>

<form id="form1" runat="server">

    <div class="login-container">

        <!-- LADO IZQUIERDO - LOGO -->
        <div class="login-left">
            <div class="logo-flux">
                <div class="logo-flux-icon">
                    <i class="bi bi-check-circle"></i>
                </div>
                <div class="logo-flux-text">FLUX</div>
            </div>
        </div>

        <!-- LADO DERECHO - FORMULARIO -->
        <div class="login-right">
            <div class="login-form-wrapper">

                <h1 class="login-title">BIENVENIDO/A!</h1>
                

                <!-- ERROR MESSAGE -->
                <asp:Label
                    ID="lblError"
                    runat="server"
                    CssClass="error-message"
                    Visible="false">
                </asp:Label>

                <!-- EMAIL -->
                <div class="form-group">
                    <asp:TextBox
                        ID="txtEmail"
                        runat="server"
                        CssClass="form-control"
                        placeholder="manager@flux.com"
                        TextMode="Email">
                    </asp:TextBox>
                </div>

                <!-- PASSWORD -->
                <div class="form-group">
                    <asp:TextBox
                        ID="txtPassword"
                        runat="server"
                        CssClass="form-control"
                        TextMode="Password"
                        placeholder="••••••••">
                    </asp:TextBox>
                </div>

                

                <!-- LOGIN BUTTON -->
                <div class="form-group">
                    <asp:Button
                        ID="btnIngresar"
                        runat="server"
                        Text="Iniciar Sesion"
                        CssClass="btn-login"
                        OnClick="btnIngresar_Click"
                        />
                </div>

                <!-- REGISTER LINK -->
                

                <!-- SOCIAL ICONS -->
                

            </div>
        </div>

    </div>

</form>

</body>
</html>
