import 'package:apk_test/app/core/index.dart';
import 'package:apk_test/app/features/auth/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterForm extends StatelessWidget {
  final VoidCallback fromGoogleImport;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _directionController = TextEditingController();
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();

  RegisterForm({super.key, required this.fromGoogleImport});

  final ValueNotifier<bool> markASRead = ValueNotifier(false);
  final ValueNotifier<bool> _obscurePasswordNotifier = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Título
                  Text(
                    'Crear cuenta',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primary,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Campo de Nombre
                  TextFormField(
                    controller: _nameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      hintText: 'Nombre',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            BorderSide(color: Colors.grey.shade300, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            BorderSide(color: AppColor.primary, width: 2),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa su nombre';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Campo de Apellido
                  TextFormField(
                    controller: _lastNameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      hintText: 'Apellidos',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            BorderSide(color: Colors.grey.shade300, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            BorderSide(color: AppColor.primary, width: 2),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa su nombre';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Campo de Email
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email_outlined),
                      hintText: 'Correo Electrónico',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            BorderSide(color: Colors.grey.shade300, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            BorderSide(color: AppColor.primary, width: 2),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa tu correo';
                      }
                      if (!value.contains('@')) {
                        return 'Ingresa un correo válido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Campo de Contraseña
                  ValueListenableBuilder<bool>(
                      valueListenable: _obscurePasswordNotifier,
                      builder: (context, isPasswordObscured, child) {
                        return TextFormField(
                          controller: _passwordController,
                          obscureText: isPasswordObscured,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock_outlined),
                            suffixIcon: IconButton(
                              icon: Icon(
                                isPasswordObscured
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                              ),
                              onPressed: () {
                                _obscurePasswordNotifier.value =
                                    !_obscurePasswordNotifier.value;
                              },
                            ),
                            hintText: 'Contraseña',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade300, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Color(0xFF4A148C), width: 2),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa tu contraseña';
                            }
                            if (value.length < 6) {
                              return 'La contraseña debe tener al menos 6 caracteres';
                            }
                            return null;
                          },
                        );
                      }),
                  const SizedBox(height: 16),

                  // Campo de telefono
                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.phone_android),
                      hintText: '+ 34 123 456 789 (Opcional)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            BorderSide(color: Colors.grey.shade300, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            BorderSide(color: AppColor.primary, width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Campo de direccion
                  TextFormField(
                    controller: _directionController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.location_on),
                      hintText: 'Calle Principal, 123 (Opcional)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            BorderSide(color: Colors.grey.shade300, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            BorderSide(color: AppColor.primary, width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Campos de ciudad y país en una fila
                  // Campos de ciudad y país en una fila
                  Row(
                    // Remove the Expanded wrapper around the Row
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Wrap the first TextFormField in Expanded
                      Expanded(
                        child: TextFormField(
                          controller: _cityController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.flag),
                            hintText: 'Barcelona',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade300, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  BorderSide(color: AppColor.primary, width: 2),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                          width: 16), // Add some spacing between fields
                      // Wrap the second TextFormField in Expanded
                      Expanded(
                        child: TextFormField(
                          controller: _countryController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.public),
                            hintText: 'España',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade300, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  BorderSide(color: AppColor.primary, width: 2),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  //Terminos y condiciones
                  Row(
                    children: [
                      ValueListenableBuilder<bool>(
                        valueListenable: markASRead,
                        builder: (context, isChecked, child) {
                          return Checkbox(
                            value: isChecked,
                            onChanged: (value) {
                              markASRead.value = !markASRead.value;
                            },
                          );
                        },
                      ),
                      const Expanded(
                        child: Text(
                          'Acepto los términos y condiciones',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Seccion de Demo Rápida (NUEVA IMPLEMENTACIÓN)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: AppColor.primary.withOpacity(0.05), // Fondo suave
                      borderRadius: BorderRadius.circular(12),
                      // Usar un CustomPainter para el borde punteado si es necesario.
                      // Por simplicidad, aquí usaremos un borde sólido con un color suave:
                      border: Border.all(color: AppColor.primary, width: 1.5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Título de la demo
                        Row(
                          children: [
                            Icon(Icons.rocket_launch_outlined,
                                color: AppColor.primary, size: 20),
                            const SizedBox(width: 8),
                            Text(
                              'Demo rápida (5 minutos)',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColor.primary,
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                            height: 20, thickness: 1, color: Color(0xFFE0E0E0)),

                        // Detalles de la demo (Nombre, Email, Local)
                        _buildDemoDetail(
                            'Nombre:',
                            _nameController.text.isEmpty
                                ? 'Javier García'
                                : _nameController.text),
                        _buildDemoDetail(
                            'Email:',
                            _emailController.text.isEmpty
                                ? 'javier@demo.com'
                                : _emailController.text),
                        const SizedBox(height: 20),

                        // Botón de iniciar demo
                        Center(
                          child: SizedBox(
                            height: 40,
                            child: OutlinedButton.icon(
                              onPressed: () {
                                // Lógica para iniciar la demo
                              },
                              icon:
                                  const Icon(Icons.flash_on_outlined, size: 20),
                              label: const Text('Iniciar demo rápida'),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: AppColor.primary,
                                side: BorderSide(
                                    color: AppColor.primary, width: 1.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Botón de Iniciar Sesión
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return SizedBox(
                        width: 60.0.wp(context),
                        height: 6.0.hp(context),
                        child: ElevatedButton(
                          onPressed: () {
                            if (markASRead.value == false) {
                              EasyLoadingHelper.showToastInfo(
                                  'Verificar términos y condiciones');
                            } else {
                              if (_formKey.currentState!.validate()) {
                                context.read<AuthBloc>().add(
                                      RegisterRequested(
                                        name: _nameController.text,
                                        lastName: _lastNameController.text,
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                        phoneNumber:
                                            _hasValidData(_phoneController.text)
                                                ? _phoneController.text
                                                : '',
                                        // address:
                                        //     _hasValidData(_directionController.text)
                                        //         ? _directionController.text
                                        //         : '',
                                        // locality:
                                        //     _hasValidData(_cityController.text)
                                        //         ? _cityController.text
                                        //         : '',
                                        // country:
                                        //     _hasValidData(_countryController.text)
                                        //         ? _countryController.text
                                        //         : '',
                                      ),
                                    );
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4A148C),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 4,
                          ),
                          child: state is AuthLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                )
                              : const Text(
                                  'Continuar',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),

                  // Divider con texto
                  Row(
                    children: [
                      Expanded(child: Divider(color: Colors.grey.shade300)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'O continúa con',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.grey.shade300)),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Botón de Google My Business
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        fromGoogleImport.call();
                      },
                      icon: Image.network(
                        'https://www.google.com/favicon.ico',
                        width: 20,
                        height: 20,
                      ),
                      label: const Text('Google My Business'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black87,
                        side: BorderSide(color: Colors.grey.shade300, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),

                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const Text('¿Ya tienes una cuenta?'),
                    TextButton(
                      onPressed: () {
                        context.go('/login');
                      },
                      child: const Text('Inicia sesión'),
                    ),
                  ])
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget auxiliar para las filas de detalle de la demo
  Widget _buildDemoDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}

bool _hasValidData(String text) {
  if (text != '' && text.isNotEmpty) {
    return true;
  }
  return false;
}
