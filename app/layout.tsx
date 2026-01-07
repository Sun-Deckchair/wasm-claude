import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "We Are Scan Me",
  description: "Pet tracking and street animal welfare for Koh Samui, Thailand",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}
